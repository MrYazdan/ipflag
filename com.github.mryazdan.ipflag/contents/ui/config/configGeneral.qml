import QtQuick 2.0
import QtQuick.Controls 1.0 as QtControls
import QtQuick.Layouts 1.0
import QtQuick.Dialogs 1.2

ColumnLayout {
    id: configPage

    Layout.minimumWidth: parent.width
    Layout.maximumWidth: parent.width
    Layout.preferredWidth: parent.width

    property alias cfg_widgetIconSize: widgetIconSizeCombo.currentIndex
    property alias cfg_updateInterval: updateIntervalSpin.value
    property alias cfg_fontSize: fontSizeSpin.value
    property alias cfg_showWidgetLabel: showWidgetLabel.checked
    property alias cfg_showFlagInCompact: showFlagInCompact.checked
    property alias cfg_showIPInCompact: showIPInCompact.checked
    property alias cfg_showVPNIcon: showVPNIcon.checked
    property alias cfg_vpnKeywords: vpnKeywordsEdit.text

    QtControls.GroupBox {
        Layout.fillWidth: true
        title: "IP Address"
        // flat: true

        ColumnLayout {
            RowLayout {
                QtControls.Label {
                    text: 'Update Interval:'
                }

                QtControls.SpinBox {
                    id: updateIntervalSpin
                    minimumValue: 2
                    maximumValue: 60
                    decimals: 0
                    stepSize: 1
                    suffix: ' min'
                }
            }

            RowLayout {
                QtControls.Label {
                    text: "Icon size shown in the widget:"
                }

                QtControls.ComboBox {
                    id: widgetIconSizeCombo
                    model: ["Default", "Tiny", "Small", "Small-Medium", "Medium", "Large", "Huge", "Enormous"]
                }
            }

            RowLayout {
                QtControls.Label {
                    text: 'Widget Font size:'
                }

                QtControls.SpinBox {
                    id: fontSizeSpin
                    minimumValue: 10
                    maximumValue: 200
                    decimals: 0
                    stepSize: 5
                    suffix: ' %'
                }
            }

            QtControls.CheckBox {
                id: showWidgetLabel
                text: "Display the label alongside the widget icon"
            }

            QtControls.CheckBox {
                id: showFlagInCompact
                text: "Display Country flag in widget icon"
            }

            QtControls.CheckBox {
                id: showIPInCompact
                text: "Display IP address next to widget icon"
            }
        }
    }

    QtControls.GroupBox {
        Layout.fillWidth: true
        title: "VPN Status (Experimental feature)"
        // flat: true

        ColumnLayout {
            QtControls.Label {
                textFormat: Text.RichText
                text: 'Explanation for VPN status icon:\n<ul><li><b>Red shield</b> icon: VPN is not active;</li><li><b>Green shield</b> icon: VPN is active;</li><li><b>Orange disk with question mark</b>: some error happened or ambigous situation.</li></ul>'
            }

            QtControls.CheckBox {
                id: showVPNIcon
                text: "Display the VPN status icon"
            }

            QtControls.Label {
                text: 'Keywords used to search for active VPNs when using nmcli utility (use pipe character as separator):'
            }

            QtControls.TextField {
                id: vpnKeywordsEdit
                width: 300
                focus: true
                selectByMouse: true
            }
        }
    }

    Item { // tighten layout
        Layout.fillHeight: true
    }
}
