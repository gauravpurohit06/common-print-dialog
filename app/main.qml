import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0

ApplicationWindow {
    id: applicationWindow
    visible: true
    width: 650
    height: 530
    minimumWidth: 650
    minimumHeight: 530
    maximumWidth: 650
    maximumHeight: 530
    title: qsTr("Print Document")

    property alias generalDestinationModel: general.destinationModel
    property alias generalDestinationComboBox: general.destinationComboBox
    property alias moreOptionsGeneralDestinationModel: moreOptions.generalDestinationModel
    property alias moreOptionsGeneralDestinationComboBox: moreOptions.generalDestinationComboBox
    property alias generalPaperSizeModel: general.paperSizeModel
    property alias generalPaperSizeComboBox: general.paperSizeComboBox

    function updateDestinationModel(printer) {
        generalDestinationModel.append({destination: printer})
        moreOptionsGeneralDestinationModel.append({destination: printer})
        if (generalDestinationComboBox.currentIndex == -1 && generalDestinationComboBox.count > 0)
            generalDestinationComboBox.currentIndex = 0
        if (moreOptionsGeneralDestinationComboBox.currentIndex == -1 && moreOptionsGeneralDestinationComboBox.count > 0)
            moreOptionsGeneralDestinationComboBox.currentIndex = 0
    }

    function updatePaperSizeModel(media) {
        generalPaperSizeModel.append({pageSize: media})
        if (generalPaperSizeComboBox.currentIndex == -1 && generalPaperSizeComboBox.count > 0)
            generalPaperSizeComboBox.currentIndex = 0
    }

    General {
        id: general
        visible: true
        scale: 0.98
    }

    MoreOptions {
        id: moreOptions
        visible: false
        scale: 0.98
    }
}
