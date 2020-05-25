package prioritizeImpl

import (
	"k8s.io/api/core/v1"
	_ "k8s.io/apimachinery/pkg/fields"
	_ "k8s.io/client-go/tools/cache"
	schedulerapi "k8s.io/kubernetes/pkg/scheduler/api/v1"
	"log"
	_ "time"
)
var (
	//优选阶段  --- 需要修改的部分
	ZeroPriority = Prioritize{
		Name: "scoreFilter", // 请与extender.yaml中保持一致
		Func: func(pod v1.Pod, nodes []v1.Node) (*schedulerapi.HostPriorityList, error) {
			var priorityList schedulerapi.HostPriorityList
			priorityList = make([]schedulerapi.HostPriority, len(nodes))
			// 获取Pod的请求容量
			var reqCpu int64
			var reqMem int64
			reqCpu = 0
			reqMem = 0
			podContainer := pod.Spec.Containers
			for _, oneContainer := range podContainer {
				reqCpu += oneContainer.Resources.Requests.Cpu().MilliValue()
				reqMem += oneContainer.Resources.Requests.Memory().MilliValue()
			}
			log.Print("当前待调度POD【",pod.Name,"】请求资源量：CPU=",reqCpu," Mem=", reqMem)
			for i, node := range nodes {
				// 标记该节点的得分
				priorityList[i] = schedulerapi.HostPriority{
					Host:  node.Name,
					Score: 0,
				}
			}
			return &priorityList, nil
		},
	}
)