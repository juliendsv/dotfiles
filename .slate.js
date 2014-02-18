slate.log('Loading config')

var getKeystroke = function(key) {
    return key + ':ctrl,shift'
}

var screens = {
    laptop: '1440x900',
    thunderbolt: '2560x1440'
}

// Operations

var operations = {}
var windowMargin = 10

/**
 * Applies the operation or list of operations
 */
operations.apply = function(window, operation) {
    if (Array.isArray(operation)) {
        operation.forEach(function(subOperation) {
            operations.apply(window, subOperation)
        })
    } else {
        window.doOperation(operation)
    }
}

operations.moveToHalfLeftTop = function() {
    return slate.operation('move', {
        x: 'screenOriginX',
        y: 'screenOriginY',
        width: 'screenSizeX / 2',
        height: 'screenSizeY / 1.6'
    })
}

operations.moveToHalfLeftDown = function() {
    return slate.operation('move', {
        x: 'screenOriginX',
        y: 'screenOriginY + 892',
        width: 'screenSizeX / 2',
        height: '520'
    })
}


operations.moveToHalfRight = function() {
    return slate.operation('move', {
        x: 'screenOriginX + screenSizeX / 2',
        y: 'screenOriginY', 
        width: 'screenSizeX / 2',
        height: 'screenSizeY'
    })
}

operations.maximize = function() {
    return slate.operation('move', {
        x: 'screenOriginX',
        y: 'screenOriginY',
        width: 'screenSizeX',
        height: 'screenSizeY'
    })
}

operations.pad = function(top, right, bottom, left) {
    var xPadding = right + left
    var yPadding = top + bottom
    return [
        slate.operation('resize', {width: '-' + xPadding, height: '-' + yPadding}),
        slate.operation('nudge', {x: '+' + left, y: '+' + top})
    ]
}

// Application operation by screen count

var appsOperationsByScreenCount = {
    'Google Chrome': {
        1: operations.maximize(),
        2: [
            slate.operation('throw', {screen: screens.thunderbolt}),
            operations.moveToHalfLeftTop(),
            operations.pad(windowMargin, windowMargin / 2, windowMargin, windowMargin)
        ]
    },
    Terminal: {
        1: [
            operations.maximize(),
            operations.pad(windowMargin, windowMargin, windowMargin, windowMargin),
        ],
        2: [
            slate.operation('throw', {screen: screens.thunderbolt}),
            operations.moveToHalfLeftDown(),
            operations.pad(windowMargin, windowMargin, windowMargin, windowMargin / 2)
        ]
    },
    'Sublime Text 2': {
        1: [
            operations.maximize(),
            operations.pad(windowMargin, windowMargin, windowMargin, windowMargin),
        ],
        2: [
            slate.operation('throw', {screen: screens.thunderbolt}),
            operations.moveToHalfRight(),
            operations.pad(windowMargin, windowMargin, windowMargin, windowMargin / 2)
        ]
    },
    'PyCharm': {
        1: [
            operations.maximize(),
            operations.pad(windowMargin, windowMargin, windowMargin, windowMargin),
        ],
        2: [
            slate.operation('throw', {screen: screens.thunderbolt}),
            operations.moveToHalfRight(),
            operations.pad(windowMargin, windowMargin, windowMargin, windowMargin / 2)
        ]
    },    
    'NetBeans': {
        1: [
            operations.maximize(),
            operations.pad(windowMargin, windowMargin, windowMargin, windowMargin),
        ],
        2: [
            slate.operation('throw', {screen: screens.thunderbolt}),
            operations.moveToHalfRight(),
            operations.pad(windowMargin, windowMargin, windowMargin, windowMargin / 2)
        ]
    },
    'HipChat': {
        1: [
            operations.maximize(),
            operations.pad(windowMargin, windowMargin, windowMargin, windowMargin),
        ],
        2: [
            slate.operation('throw', {screen: screens.laptop}),
            operations.maximize()
        ]
    }    
}

var refresh = function() {
    var screenCount = slate.screenCount()
    slate.eachApp(function(app) {
        var appOperationsByScreenCount = appsOperationsByScreenCount[app.name()] || []
        var appOperations = appOperationsByScreenCount[screenCount] || []
        app.eachWindow(function(window) {
            operations.apply(window, appOperations)
        })
    })
}

slate.on('screenConfigurationChanged', refresh)

refresh()

//

slate.bind(getKeystroke('r'), slate.operation('relaunch'))

slate.log('Config loaded')
