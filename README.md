1. 创建iOS项目

2. 项目目录创建package.json文件， touch package.json，编辑package.json文件， 添加js库 (管理js三方库)

   ```javascript
   {
   	"name": "NativeReactApp",
   	"version": "0.0.1",
   	"private": true,
   	"scripts": {
   		"start": "react-native start",
   		"test": "jest",
   		"lint": "eslint ."
   	},
   	"dependencies": {
       	"react": "16.9.0",
       	"react-native": "0.61.3"
     	},
     	"devDependencies": {
       	"@babel/core": "^7.6.4",
       	"@babel/runtime": "^7.6.3",
       	"@react-native-community/eslint-config": "^0.0.5",
      		"babel-jest": "^24.9.0",
       	"eslint": "^6.6.0",
       	"jest": "^24.9.0",
       	"metro-react-native-babel-preset": "^0.56.3",
       	"react-test-renderer": "16.9.0"
     	},
     	"jest": {
       	"preset": "react-native"
     	}
   }
   ```

3. 执行npm install / yarn installl ,安装 js 库， 安装完成后的 js 库会放在目录下 node_modules 目录

4. 创建 podfile, 添加react-native 依赖库，执行 pod install

   ```ruby
     # Pods for NativeReactApp  path 依赖于真实路径 
     pod 'FBLazyVector', :path => "./node_modules/react-native/Libraries/FBLazyVector"
     pod 'FBReactNativeSpec', :path => "./node_modules/react-native/Libraries/FBReactNativeSpec"
     pod 'RCTRequired', :path => "./node_modules/react-native/Libraries/RCTRequired"
     pod 'RCTTypeSafety', :path => "./node_modules/react-native/Libraries/TypeSafety"
     pod 'React', :path => './node_modules/react-native/'
     pod 'React-Core', :path => './node_modules/react-native/'
     pod 'React-CoreModules', :path => './node_modules/react-native/React/CoreModules'
     pod 'React-Core/DevSupport', :path => './node_modules/react-native/'
     pod 'React-RCTActionSheet', :path => './node_modules/react-native/Libraries/ActionSheetIOS'
     pod 'React-RCTAnimation', :path => './node_modules/react-native/Libraries/NativeAnimation'
     pod 'React-RCTBlob', :path => './node_modules/react-native/Libraries/Blob'
     pod 'React-RCTImage', :path => './node_modules/react-native/Libraries/Image'
     pod 'React-RCTLinking', :path => './node_modules/react-native/Libraries/LinkingIOS'
     pod 'React-RCTNetwork', :path => './node_modules/react-native/Libraries/Network'
     pod 'React-RCTSettings', :path => './node_modules/react-native/Libraries/Settings'
     pod 'React-RCTText', :path => './node_modules/react-native/Libraries/Text'
     pod 'React-RCTVibration', :path => './node_modules/react-native/Libraries/Vibration'
     pod 'React-Core/RCTWebSocket', :path => './node_modules/react-native/'
   
     pod 'React-cxxreact', :path => './node_modules/react-native/ReactCommon/cxxreact'
     pod 'React-jsi', :path => './node_modules/react-native/ReactCommon/jsi'
     pod 'React-jsiexecutor', :path => './node_modules/react-native/ReactCommon/jsiexecutor'
     pod 'React-jsinspector', :path => './node_modules/react-native/ReactCommon/jsinspector'
     pod 'ReactCommon/jscallinvoker', :path => "./node_modules/react-native/ReactCommon"
     pod 'ReactCommon/turbomodule/core', :path => "./node_modules/react-native/ReactCommon"
     pod 'Yoga', :path => './node_modules/react-native/ReactCommon/yoga'
   
     pod 'DoubleConversion', :podspec => './node_modules/react-native/third-party-podspecs/DoubleConversion.podspec'
     pod 'glog', :podspec => './node_modules/react-native/third-party-podspecs/glog.podspec'
     pod 'Folly', :podspec => './node_modules/react-native/third-party-podspecs/Folly.podspec'
   ```

   

5. 创建 index.ios.js 文件，touch index.ios.js， 添加js代码

   ```javascript
   import React, {Component} from 'react'
   
   import {
     AppRegistry
   }from 'react-native'
   
   // 引入组件
   import ReactNativeRootView from "./ReactNativeRootView";
   
   // 注册
   AppRegistry.registerComponent('ReactNativeRootView', ()=> ReactNativeRootView);
   ```

   ```javascript
   // ReactNativeRootView 组件js代码
   import React, {Component} from 'react'
   import {
       View,
       Text,
       StyleSheet,
   }from 'react-native'
   
   
   class ReactNativeRootView extends Component{
       render() {
           return(
               <View style={styles.contentStyle}>
                   <Text style={styles.textStyle}>Hello ReactNative!</Text>
               </View>
           )
       }
   }
   
   const styles = StyleSheet.create({
       contentStyle: {
           flex: 1,
           justifyContent:'center',
           alignItems: 'center',
       },
       textStyle: {
           fontSize: 30,
           color: '#1ac8e8'
       }
   })
   
   export default ReactNativeRootView
   ```

6. 原生页面中构建 reactNative 页面

   ```swift
   NSString *jsUrl = @"http://localhost:8081/index.ios.bundle?platform=ios";
   // 连接真机调试把 localhost 改成本机 IP 地址
   NSURL *jsCodeLocation = [NSURL URLWithString:jsUrl];
       
   RCTRootView *rootView = [[RCTRootView alloc] initWithBundleURL:jsCodeLocation moduleName:@"ReactNativeRootView" initialProperties:nil launchOptions:nil];
   self.view = rootView;
   ```

7. Info.plist 添加配置

   ```xml
   <key>NSAppTransportSecurity</key>
   
   <dict>
   
     <key>NSExceptionDomains</key>
   
     <dict>
   
   ​    <key>localhost</key>
   
   ​    <dict>
   
   ​      <key>NSTemporaryExceptionAllowsInsecureHTTPLoads</key>
   
   ​      <true/>
   
   ​    </dict>
   
     </dict>
   
   </dict>
   ```

   

8. 在node_modules所在目录执行 npm start , 然后运行iOS项目即可进入reactnative页面

   

**参考**： react-native init AwesomeProject， 使用react-native 命令创建官方项目，参考官方创建项目中 package.json, index.ios.js, podfile 中写法👍👍(因为react-native版本问题编译报错，尝试修复错误话费很长时间，最后靠官方方式创建demo成功)



**真机调试**

1. 把jsCodeLocating 地址localhost 改成本机Mac的IP地址
2. info.plist 添加 key: Allow Arbitrary Loads  value: YES
3. 保证设备和Mac连接同一个网络

 **采坑**： js 代码localhost 已经改成ip, 因为设备挂了Charles代理，但是Charles并没有开启，懵逼。。



**错误集合**

1. error: listen eaddrinuse: address already in use :::8081 react native

   本机8081端口被占用，需要杀死本机使用8081端口的任务，执行下面命令。

```
$ sudo lsof -i :8081  // 查找出本地占用 8081 端口的任务，在这儿可以看到任务 pid

$ kill -9 23583(pid)  // 结束pid任务 
```



