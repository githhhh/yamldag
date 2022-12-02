# yamldag

简单格式yaml 依赖描述转换DAG(有向无环图)可视化
* 环检测，输出环 task_a=>task_b=>task_c=>task_a
* 如果是有向无环图 按依赖顺序输出所有节点、深度优先搜索、广度优先搜索遍历所有节点
* 可视化DAG 生成graph.dot 、graph.svg 

### 使用方法

simple.yaml

```
# a simple yaml example
task_a:
  task_b:
    task_c:
      task_a:
  task_d:
```

  
```console
gem install yamldag 
yamldag path/to/simple.yaml
```

输出可视化文件 graph.dot 、graph.svg 

### .dot 文件预览：

```console
brew install xdot  
xdot graph.dot 
```

![](https://s3.uuu.ovh/imgs/2022/12/02/f88db91bea75dc50.gif)
