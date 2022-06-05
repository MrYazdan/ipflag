
import QtQuick 2.0
import QtQuick.Controls 1.0 as QtControls
import QtQuick.Controls.Styles 1.0
import QtQuick.Layouts 1.0
import QtQuick.Dialogs 1.2

ColumnLayout {
    id: appearancePage

    Layout.minimumWidth: parent.width
    Layout.maximumWidth: parent.width
    Layout.preferredWidth: parent.width

    // property alias cfg_widgetIconSize: widgetIconSizeCombo.currentIndex
    // property alias cfg_updateInterval: updateIntervalSpin.value
    // property alias cfg_layoutRow: layoutRow.checked
    // property alias cfg_showFlagInCompact: showFlagInCompact.checked
    property alias cfg_mapSize: mapSizeSpin.value
    property alias cfg_mapZoomLevel: mapZoomLevelSpin.value
    property alias cfg_showHostname: showHostname.checked
    property alias cfg_layoutRow: layoutRow.checked
    property alias cfg_useLabelThemeColor: labelThemeColorCheckBox.checked
    property alias cfg_labelColor: labelColorRectangle.color
    property alias cfg_useLinkThemeColor: linkThemeColorCheckBox.checked
    property alias cfg_linkColor: linkColorRectangle.color

    QtControls.GroupBox {
        Layout.fillWidth: true
        title: "Map configurations"

        ColumnLayout {

            RowLayout {
                QtControls.Label {
                    text: 'Map Size:'
                }

                QtControls.SpinBox {
                    id: mapSizeSpin
                    minimumValue: 50
                    maximumValue: 500
                    decimals: 0
                    stepSize: 1
                    suffix: ' px'
                }
            }

            RowLayout {
                QtControls.Label {
                    text: 'Default zoom level:'
                }

                QtControls.SpinBox {
                    id: mapZoomLevelSpin
                    minimumValue: 0
                    maximumValue: 19
                    decimals: 0
                    stepSize: 1
                    suffix: ''
                }
            }
        }
    }

    QtControls.GroupBox {
        Layout.fillWidth: true
        title: "Layout"

        ColumnLayout {
            QtControls.ExclusiveGroup { id: displayOrderGroup }
            QtControls.RadioButton {
                id: layoutRow
                text: 'Use horizontal layout'
                exclusiveGroup: displayOrderGroup
            }
            QtControls.RadioButton {
                id: layoutColumn
                text: 'Use vertical layout'
                checked: !layoutRow.checked
                exclusiveGroup: displayOrderGroup
            }
        }
    }

    QtControls.GroupBox {
        Layout.fillWidth: true
        title: "Set Custom Colors"

        GridLayout {
            id: labelsContainer
            flow: GridLayout.LeftToRight
            columns: 2
            Layout.minimumWidth: 300
            Layout.maximumWidth: 300
            Layout.preferredWidth: 300

            QtControls.CheckBox {
                id: labelThemeColorCheckBox
                text: "Use Label Theme Color"
            }

            QtControls.Button {
                enabled: !labelThemeColorCheckBox.checked
                onClicked: labelColorDialog.open();

                Rectangle {
                    id: labelColorRectangle
                    x: 4
                    y: 4
                    width: parent.width - 8
                    height: parent.height - 8
                    color: cfg_labelColor
                    border.width: 0
                }
            }

            QtControls.CheckBox {
                id: linkThemeColorCheckBox
                text: "Use Links Theme Color"
            }

            QtControls.Button {
                enabled: !linkThemeColorCheckBox.checked
                onClicked: linkColorDialog.open();

                Rectangle {
                    id: linkColorRectangle
                    x: 4
                    y: 4
                    width: parent.width - 8
                    height: parent.height - 8
                    color: cfg_linkColor
                    border.width: 0
                }
            }
        }
    }

    ColorDialog {
        id: labelColorDialog
        onAccepted: cfg_labelColor = this.color
    }

    ColorDialog {
        id: linkColorDialog
        onAccepted: cfg_linkColor = this.color
    }

    Item { // tighten layout
        Layout.fillHeight: true
    }
}
