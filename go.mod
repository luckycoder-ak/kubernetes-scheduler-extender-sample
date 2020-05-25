module kubernetes-scheduler-extender-sample

go 1.11

replace (
	k8s.io/api => k8s.io/api v0.0.0-20191004102255-dacd7df5a50b
	k8s.io/apiextensions-apiserver => k8s.io/apiextensions-apiserver v0.0.0-20191004105443-a7d558db75c6
	k8s.io/apimachinery => k8s.io/apimachinery v0.0.0-20191004074956-c5d2f014d689
	k8s.io/apiserver => k8s.io/apiserver v0.0.0-20191004103531-b568748c9b85
	k8s.io/cli-runtime => k8s.io/cli-runtime v0.0.0-20191004110054-fe9b9282443f
	k8s.io/client-go => k8s.io/client-go v10.0.0+incompatible
	k8s.io/cloud-provider => k8s.io/cloud-provider v0.0.0-20191004110922-5f56183d0215
	k8s.io/cluster-bootstrap => k8s.io/cluster-bootstrap v0.0.0-20190817224935-740e7515bc96
	k8s.io/code-generator => k8s.io/code-generator v0.0.0-20190704094322-1ed9df051d9b
	k8s.io/component-base => k8s.io/component-base v0.17.0
	k8s.io/cri-api => k8s.io/cri-api v0.17.0
	k8s.io/csi-translation-lib => k8s.io/csi-translation-lib v0.17.0
	k8s.io/kube-aggregator => k8s.io/kube-aggregator v0.0.0-20191004103911-2797d0dcf14b
	k8s.io/kube-controller-manager => k8s.io/kube-controller-manager v0.0.0-20190817224845-a4b958a6159f
	k8s.io/kube-proxy => k8s.io/kube-proxy v0.0.0-20190817224620-bff7f593c53f
	k8s.io/kube-scheduler => k8s.io/kube-scheduler v0.0.0-20190817224758-2fb6d39912dc
	k8s.io/kubectl => k8s.io/kubectl v0.17.0
	k8s.io/kubelet => k8s.io/kubelet v0.0.0-20190817224709-8d84603a161b
	k8s.io/legacy-cloud-providers => k8s.io/legacy-cloud-providers v0.17.0
	k8s.io/metrics => k8s.io/metrics v0.17.0
	k8s.io/sample-apiserver => k8s.io/sample-apiserver v0.0.0-20191004104149-1f594deb1aa8
)

require (
	github.com/comail/colog v0.0.0-20160416085026-fba8e7b1f46c
	github.com/gogo/protobuf v1.3.1 // indirect
	github.com/golang/groupcache v0.0.0-20200121045136-8c9f03a8e57e // indirect
	github.com/golang/protobuf v1.4.1 // indirect
	github.com/google/btree v1.0.0 // indirect
	github.com/google/gofuzz v1.1.0 // indirect
	github.com/googleapis/gnostic v0.4.0 // indirect
	github.com/gregjones/httpcache v0.0.0-20190611155906-901d90724c79 // indirect
	github.com/hashicorp/golang-lru v0.5.4 // indirect
	github.com/json-iterator/go v1.1.9 // indirect
	github.com/julienschmidt/httprouter v1.3.0
	github.com/kr/pretty v0.2.0 // indirect
	github.com/modern-go/reflect2 v1.0.1 // indirect
	github.com/peterbourgon/diskv v2.0.1+incompatible // indirect
	github.com/spf13/pflag v1.0.5 // indirect
	github.com/stretchr/testify v1.5.1 // indirect
	golang.org/x/net v0.0.0-20200506145744-7e3656a0809f // indirect
	golang.org/x/oauth2 v0.0.0-20200107190931-bf48bf16ab8d // indirect
	golang.org/x/time v0.0.0-20200416051211-89c76fbcd5d1 // indirect
	gopkg.in/check.v1 v1.0.0-20190902080502-41f04d3bba15 // indirect
	gopkg.in/inf.v0 v0.9.1 // indirect
	k8s.io/api v0.0.0-20191004102255-dacd7df5a50b
	k8s.io/apimachinery v0.0.0-20191004074956-c5d2f014d689
	k8s.io/client-go v0.0.0-00010101000000-000000000000
	k8s.io/klog v1.0.0 // indirect
	k8s.io/kubernetes v0.0.0-20191015125301-874f0559d9b3 // indirect
	sigs.k8s.io/yaml v1.2.0 // indirect
)
