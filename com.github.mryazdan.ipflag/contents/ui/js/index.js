function getIPdata(successCallback, failureCallback) {
    // append /json to the end to force json data response
    var getUrl = "http://ip-api.com/json/"

    try {
        var request = new XMLHttpRequest()
        request.onreadystatechange = function () {
            if (request.readyState !== XMLHttpRequest.DONE) {
                return
            }

            if (request.status !== 200) {
                failureCallback(request)
                return
            }

            var jsonData = JSON.parse(request.responseText)
            successCallback(jsonData)
        }
        request.open('GET', getUrl)
        request.send()

        return request
    }
    catch (err) {
        return null
    }
}


function getIconSize(iconSize, compactRoot) {
    switch(iconSize) {
        case 1:
            return units.iconSizes.tiny
        case 2:
            return units.iconSizes.small
        case 3:
            return units.iconSizes.smallMedium
        case 4:
            return units.iconSizes.medium
        case 5:
            return units.iconSizes.large
        case 6:
            return units.iconSizes.huge
        case 7:
            return units.iconSizes.enormous
        default:
            return typeof(compactRoot) === "undefined" ? units.iconSizes.medium : compactRoot.height
    }
}
