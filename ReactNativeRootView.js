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