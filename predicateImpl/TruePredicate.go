package predicateImpl

import (
	"k8s.io/api/core/v1"
	_ "k8s.io/apimachinery/pkg/fields"
	_ "k8s.io/client-go/tools/cache"
	_ "time"
)
var (
	TruePredicate = Predicate{
		Name: "preFilter", // 请与extender.yaml中保持一致
		Func: func(pod v1.Pod, node v1.Node) (bool, error) {
			return true, nil
		},
	}
)