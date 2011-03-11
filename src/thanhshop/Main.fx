/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package thanhshop;

import javafx.stage.Stage;
import javafx.scene.Scene;
import javafx.scene.text.Text;
import javafx.scene.text.Font;
import javafx.scene.control.Button;
import javafx.stage.StageStyle;
import com.datnt.services.StockServices;
import com.datnt.services.CategoryServices;
import javafx.scene.control.Label;
import javafx.scene.control.ListView;
import javafx.scene.image.Image;
import javafx.scene.image.ImageView;
import com.datnt.DTO.StockDTO;
import javafx.stage.Alert;

/**
 * @author datnt
 */
var ShowAll = true;
var ViewNewScene = false;
var Search = false;
var Edit = false;
var buttonViewNewScene = Button {
            text: "View New"
            action: btnViewAddNew
            layoutX: 655
            layoutY: 650
        }
var buttonSearch = Button {
            text: "Show Search"
            action: btnSearch
            layoutX: 730
            layoutY: 650
        }
var buttonViewEdit = Button {
            text: "Edit Item"
            action: btnEdit
            layoutX: 900
            layoutY: 650
        }
var buttonShowAll = Button {
            text: "Show ViewAll"
            action: btnShowAll
            layoutX: 900
            layoutY: 650
        }
var buttonShowAllofEdit = Button {
            text: "Show ViewAll"
            action: btnShowAll
            layoutX: 900
            layoutY: 650
        }
var buttonShowAllofViewNew = Button {
            text: "Show ViewAll"
            action: btnShowAll
            layoutX: 900
            layoutY: 650
        }
var buttonNew = Button {
            text: "Thêm mới"
            action: btnAddNew
            layoutX: 820
            layoutY: 650
        }
var buttonDelete = Button {
            text: "Xóa   "
            action: btnDelete
            layoutX: 600
            layoutY: 650
        }
var listItems = ListView {
            layoutY: 30
            layoutX: 10
        }
var stockName = Label {
            text: bind listItems.selectedItem as String
            layoutX: 200
            layoutY: 30
        };
var strCategory = "Loại hàng: ";
var stockCate = Label {
            text: bind strCategory
            layoutX: 200
            layoutY: 200
        };
var strDate = "Ngày nhập: ";
var date = Label {
            text: bind strDate
            layoutX: 200
            layoutY: 220
        };
var strAmount = "Số lượng: ";
var amount = Label {
            text: bind strAmount
            layoutX: 200
            layoutY: 240
        };
var strPrice = "Đơn giá: ";
var price = Label {
            text: bind strPrice
            layoutX: 200
            layoutY: 260
        };
var strSum = "Số tiền: ";
var sumP = Label {
            text: bind strSum
            layoutX: 200
            layoutY: 280
        };
var strUrl = "file:/C:/Users/Public/Pictures/Sample Pictures/Chrysanthemum.jpg";
var image: Image;
var iImage = ImageView {
            image: bind image
            x: 10
            y: 10
            fitWidth: 125
            fitHeight: 125
            layoutX: 200
            layoutY: 50
        }
def stage = Stage {
            title: "Thanh Shop - View All"
            var scShowAll = Scene {
                        width: 1000,
                        height: 700,
                        content: [
                            Text {
                                font: Font {
                                    size: 16
                                }
                                x: 10, y: 10
                                layoutY: 5
                                content: "Danh sách Hàng hóa"
                            },
                            stockName,
                            iImage,
                            stockCate,
                            amount,
                            price,
                            sumP,
                            date,
                            buttonNew,
                            buttonDelete,
                            buttonViewEdit,
                            buttonSearch,
                            buttonViewNewScene,
                            listItems,
                        ]
                    }

            var scViewAddNew = Scene {
                        width: 1000,
                        height: 700,
                        content: [

                            Text {
                                font: Font {
                                    size: 20
                                }
                                x: 10, y: 30
                                content: "HelloWorld from view add new"
                            }//,
                        //buttonViewEdit
                        ]
                    }
            var scEdit = Scene {
                        width: 1000,
                        height: 700,
                        content: [

                            Text {
                                font: Font {
                                    size: 20
                                }
                                x: 10, y: 30
                                content: "Chỉnh sửa đơn hàng"
                            },
                            buttonShowAllofEdit
                        ]
                    }
            var scSearch = Scene {
                        width: 1000,
                        height: 700,
                        content: [

                            Text {
                                font: Font {
                                    size: 20
                                }
                                x: 10, y: 30
                                content: "Tìm kiếm hàng hóa"
                            },
                            buttonShowAll
                        ]
                    }

            scene: bind if (ViewNewScene) then scViewAddNew else if (ShowAll) then scShowAll else if (Edit) then scEdit else scSearch
        }

function btnViewAddNew(): Void {
    ShowAll = false;
    ViewNewScene = true;
    Search = false;
    Edit = false;
}

function btnSearch(): Void {
    ShowAll = false;
    ViewNewScene = false;
    Search = true;
    Edit = false;
}

function btnEdit(): Void {
    ShowAll = false;
    ViewNewScene = false;
    Search = false;
    Edit = true;
}

function btnShowAll(): Void {
    ShowAll = true;
    ViewNewScene = false;
    Search = false;
    Edit = false;
}

function btnAddNew(): Void {
    var formNew: AddNew = AddNew {
                style: StageStyle.DECORATED
            }
}

function btnDelete(): Void {
    var result:Boolean = Alert.question("Bạn có muốn xóa mặt hàng này?");
    println('decision of me == {result}');
}
/*FUNCTION AREA*/

FindAllStock();

function FindAllStock(): Void {
    var stockArray: String[] = StockServices.FindAll();
    listItems.items = null;
    for (c in stockArray) {
        var entry: String = "{c}";
        insert entry into listItems.items;
    }
    listItems.select(0);
}

var bindToSelectedItem = bind listItems.selectedItem on replace {
            //BEGIN: DEMO CODE
            image = Image {
                        url: strUrl;
                    }
            strUrl = "file:/C:/Users/Public/Pictures/Sample Pictures/Desert.jpg";

            if (listItems.selectedIndex > 5) {
                strUrl = "file:/C:/Users/Public/Pictures/Sample Pictures/Hydrangeas.jpg";
            } else {
                strUrl = "file:/C:/Users/Public/Pictures/Sample Pictures/Desert.jpg";
            }
            //END: DEMO CODE

            var stockDTO: StockDTO = StockServices.GetDetail(listItems.selectedItem as String);

            strCategory = "Loại hàng: {CategoryServices.GetCategoryName(stockDTO.getCategoryID())}";
            strDate = "Ngày nhập: {stockDTO.getCr8_Date()}";
            strAmount = "Số lượng: {stockDTO.getSoluong()}";
            strPrice = "Đơn giá: {stockDTO.getDongia()}";
            strSum = "Số tiền: {stockDTO.getSotien()}";
        }
