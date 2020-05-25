package main

import (
	"github.com/comail/colog"
	"github.com/julienschmidt/httprouter"
	_ "k8s.io/apimachinery/pkg/fields"
	_ "k8s.io/client-go/tools/cache"
	"kubernetes-scheduler-extender-sample/predicateImpl"
	"kubernetes-scheduler-extender-sample/prioritizeImpl"
	"log"
	"net/http"
	"os"
	"strings"
	_ "time"
)

const (
	versionPath      = "/version"
	apiPrefix        = "/scheduler"
	bindPath         = apiPrefix + "/bind"
	preemptionPath   = apiPrefix + "/preemption"
	predicatesPrefix = apiPrefix + "/predicates"
	prioritiesPrefix = apiPrefix + "/priorities"
)

// 定义数据
var (
	//版本号
	version string // injected via ldflags at build time
)

func StringToLevel(levelStr string) colog.Level {
	switch level := strings.ToUpper(levelStr); level {
	case "TRACE":
		return colog.LTrace
	case "DEBUG":
		return colog.LDebug
	case "INFO":
		return colog.LInfo
	case "WARNING":
		return colog.LWarning
	case "ERROR":
		return colog.LError
	case "ALERT":
		return colog.LAlert
	default:
		log.Printf("warning: LOG_LEVEL=\"%s\" is empty or invalid, fallling back to \"INFO\".\n", level)
		return colog.LInfo
	}
}

func main() {
	// 默认配置格式 -- 日志输出信息
	colog.SetDefaultLevel(colog.LInfo)
	colog.SetMinLevel(colog.LInfo)
	colog.SetFormatter(&colog.StdFormatter{
		Colors: true,
		Flag:   log.Ldate | log.Ltime | log.Lshortfile,
	})

	// 注册插件  -- 根据系统配置格式
	colog.Register()
	level := StringToLevel(os.Getenv("LOG_LEVEL"))
	log.Print("Log level was set to ", strings.ToUpper(level.String()))
	colog.SetMinLevel(level)

	//接口开启
	router := httprouter.New()
	AddVersion(router)

	//接入预选插件
	predicates := []predicateImpl.Predicate{predicateImpl.TruePredicate}
	for _, p := range predicates {
		AddPredicate(router, p)
	}

	//接入优选插件
 	priorities := []prioritizeImpl.Prioritize{prioritizeImpl.ZeroPriority}
	for _, p := range priorities {
		AddPrioritize(router, p)
	}

	log.Print("info: server starting on the port :80")
	if err := http.ListenAndServe(":80", router); err != nil {
		log.Fatal(err)
	}
}
