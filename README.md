# 支持kubernetes 1.13版本及以上。（注意：是extender，不是scheduler-framework） 

一 部署流程
- 制作镜像
  - 在当前目录依次执行以下命令（如有需要，请登录https://hub.docker.com/账号）
  - `IMAGE=YOUR_ORG/YOUR_IMAGE:YOUR_TAG` ：镜像tag，请修改成自己镜像仓库（同时要修改`extender.yaml`文件中的自定义调度插件镜像）
  - `docker build . -t $IMAGE`
  - `docker push $IMAGE`
- 部署
  - 执行`kubectl apply -f extender.yaml`（注：请修改`extender.yaml`文件中对应的镜像地址）  


二 扩展方式
- 如需默认调度算法（预选or优选），请修改`extender.yaml`中的`policy.cfg{} - "priorities"`，按照相同的格式加入默认调度算法的名称及权重
    - 例如`{"name" : "BalancedResourceAllocation", "weight" : 1},`
- 如需集成新的自定义调度算法，请在修改以下三部分
    - 1 在prioritizeImpl文件夹下添加新的调度插件算法，格式仿造`ZeroPriority.go`
    - 2 修改`deployment/extender.yaml`中`policy.cfg{} - "extenders"`，添加新集成的调度器（通过去除此部分调度器对应内容，即可去除指定的调度插件，无须修改其他文件）
        - 格式如下：
        ```
      {
         "urlPrefix": "http://localhost/scheduler",
         "prioritizeVerb": "priorities/调度器名称",
         "weight": 权重, 
         "enableHttps": false,
         "nodeCacheCapable": false
       },
       ```
    - 3 修改`main.go`中
       ```
      func main{
            //接入定义的优选插件，请根据需要修改
            priorities := []prioritizeImpl.Prioritize {
                prioritizeImpl.ZeroPriority,
                prioritizeImpl.OtherPriority,#这里与此前新增文件中变量名保持一致
            }
       }
       ```

三 测试
- 指定yaml中调度器名称为`my-scheduler`。（如需修改名称，请替换`extender.yaml`文件中的所有的`my-scheduler`）
- 调度nginx-test进行测试：执行`kubectl apply -f test/nginx-test.yaml`
- 查看调度器日志：
  ```
    kubectl logs pod/`kubectl  get pod -n kube-system | grep my-scheduler | awk '{print $1}'` -n kube-system  -c my-scheduler-extender-ctr
  ```