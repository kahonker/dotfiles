import QtQuick
import Quickshell
import Quickshell.Services.UPower

Text {
    property double charge: UPower.displayDevice.percentage
    property bool onBattery: UPower.onBattery
    text: onBattery ? Icons[`nf_md_battery_${Math.round(charge * 10)}`] + " " + Math.round(charge * 100) + "%" : Icons["nf_md_battery_charging"]
}
