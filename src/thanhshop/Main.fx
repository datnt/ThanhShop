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
import javafx.ext.swing.SwingTextField;
import javafx.scene.layout.HBox;
import javafx.scene.layout.VBox;
import javafx.scene.control.ChoiceBox;
import com.datnt.utils.DateTimeUtils;
import java.util.Date;
import java.text.SimpleDateFormat;
import com.datnt.beanvalidator.StockValidator;
import com.datnt.utils.Validator;

/** * @author datnt
 */
var ShowAll = true;
var ViewNewScene = false;
var Search = false;
var Edit = false;
var EditingStockDTO: StockDTO;
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
/*BEGIN GUI component for Update Stock*/
var tenhang = Label {
            text: "Tên Hàng"
        };
var txtTenhang = SwingTextField {
            columns: 10
            width: 100
            text: ""
            editable: false
        };
var hinhanh = Label {
            text: "Hình ảnh"
        };
var txtHinhanh = SwingTextField {
            columns: 25
            width: 100
            text: "Hinh anh"
        };
var btnHinhanh = Button {
            text: "Browse"
            action: btnChooseFile
        }
var loaihang = Label {
            text: "Loai hang"
        };
var listCats = ChoiceBox {
            width: 200
            height: 50
        }
var soluong = Label {
            text: "So luong"
        };
var txtSoluong = SwingTextField {
            columns: 10
            width: 100
            text: "0"
        };
var dongia = Label {
            text: "Don gia"
        };
var txtDongia = SwingTextField {
            columns: 10
            width: 100
            text: "0"
        };
var sotien = Label {
            text: "So tien"
        };
var txtSotien = SwingTextField {
            columns: 10
            width: 100
            text: "So tien"
            editable: false
        };
var ngay = Label {
            text: "Ngay"
        };
var listDays = ChoiceBox {
            width: 200
            height: 50
        }
var thang = Label {
            text: "Thang"
        };
var listMonths = ChoiceBox {
            width: 200
            height: 50
        }
var nam = Label {
            text: "Nam"
        };
var listYears = ChoiceBox {
            width: 200
            height: 50
        }
var buttonSave = Button {
            text: "Save"
            action: btnSave
        };
var buttonReset = Button {
            text: "Reset"
            action: btnReset
        };
var strNote = "Thông báo: ";
var thongbaoloi = Label {
            text: bind strNote
        };
/*END GUI component for Update Stock*/
/*BEGIN GUI component for Scene - scViewAddNew */
var strNoteAddNew = "Thông báo: ";
var thongbaoloiAddNew = Label {
            text: bind strNoteAddNew
        };
var tenhangAddNew = Label {
            text: "Tên Hàng"
        };
var txtTenhangAddNew = SwingTextField {
            columns: 10
            width: 100
            text: ""
        };
var hinhanhAddNew = Label {
            text: "Hình ảnh"
        };
var txtHinhanhAddNew = SwingTextField {
            columns: 25
            width: 100
            text: "Hinh anh"
        };
var btnHinhanhAddNew = Button {
            text: "Browse"
            action: btnChooseFileAddNew
        }
var imageAddNew: Image;
var iImageAddNew = ImageView {
            image: bind imageAddNew
            x: 10
            y: 10
            fitWidth: 125
            fitHeight: 125
            layoutX: 200
            layoutY: 50
        }
var loaihangAddNew = Label {
            text: "Loại Hàng"
        };
var listCatsAddNew = ChoiceBox {
            width: 200
            height: 50
        }
var soluongAddNew = Label {
            text: "Số lượng"
        };
var txtSoluongAddNew = SwingTextField {
            columns: 10
            width: 100
            text: "0"
        };
var dongiaAddNew = Label {
            text: "Đơn giá"
        };
var txtDongiaAddNew = SwingTextField {
            columns: 10
            width: 100
            text: "0"
        };
var sotienAddNew = Label {
            text: "Số tiền"
        };
var txtSotienAddNew = SwingTextField {
            columns: 10
            width: 100
            text: "0"
            editable: false
        };
var ngayAddNew = Label {
            text: "Ngay"
        };
var listDaysAddNew = ChoiceBox {
            width: 200
            height: 50
        }
var thangAddNew = Label {
            text: "Thang"
        };
var listMonthsAddNew = ChoiceBox {
            width: 200
            height: 50
        }
var namAddNew = Label {
            text: "Nam"
        };
var listYearsAddNew = ChoiceBox {
            width: 200
            height: 50
        }
var btnSaveAddNew = Button {
            text: "Save"
            action: btnSaveActionAddNew
        };
/*END GUI component for Scene - scViewAddNew */
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
                                content: "Tạo mới đơn hàng"
                            },

                            VBox {
                                layoutY: 50,
                                layoutX: 10,
                                spacing: 10,
                                content: [
                                    HBox {
                                        spacing: 20,
                                        content: [
                                            thongbaoloiAddNew,
                                        ]
                                    },
                                    HBox {
                                        spacing: 20,
                                        content: [
                                            tenhangAddNew,
                                            txtTenhangAddNew
                                        ]
                                    },
                                    HBox {
                                        spacing: 10,
                                        content: [
                                            hinhanhAddNew,
                                            txtHinhanhAddNew,
                                            btnHinhanhAddNew,
                                            iImageAddNew
                                        ]
                                    },
                                    HBox {
                                        spacing: 50,
                                        content: [
                                            loaihangAddNew,
                                            listCatsAddNew
                                        ]
                                    },
                                    HBox {
                                        spacing: 50,
                                        content: [
                                            soluongAddNew,
                                            txtSoluongAddNew
                                        ]
                                    },
                                    HBox {
                                        spacing: 50,
                                        content: [
                                            dongiaAddNew,
                                            txtDongiaAddNew
                                        ]
                                    },
                                    HBox {
                                        spacing: 50,
                                        content: [
                                            sotienAddNew,
                                            txtSotienAddNew
                                        ]
                                    },
                                    HBox {
                                        spacing: 10,
                                        content: [
                                            ngayAddNew,
                                            listDaysAddNew,
                                            thangAddNew,
                                            listMonthsAddNew,
                                            namAddNew,
                                            listYearsAddNew
                                        ]
                                    },
                                    HBox {
                                        spacing: 50,
                                        content: [
                                            btnSaveAddNew
                                        ]
                                    }
                                ]
                            },
                            buttonShowAllofViewNew
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
                            VBox {
                                layoutY: 50,
                                layoutX: 10,
                                spacing: 10,
                                content: [
                                    thongbaoloi,
                                    HBox {
                                        spacing: 20,
                                        content: [
                                            tenhang,
                                            txtTenhang
                                        ]
                                    },
                                    HBox {
                                        spacing: 10,
                                        content: [
                                            hinhanh,
                                            txtHinhanh,
                                            btnHinhanh
                                        ]
                                    },
                                    HBox {
                                        spacing: 50,
                                        content: [
                                            loaihang,
                                            listCats
                                        ]
                                    },
                                    HBox {
                                        spacing: 50,
                                        content: [
                                            soluong,
                                            txtSoluong
                                        ]
                                    },
                                    HBox {
                                        spacing: 50,
                                        content: [
                                            dongia,
                                            txtDongia
                                        ]
                                    },
                                    HBox {
                                        spacing: 50,
                                        content: [
                                            sotien,
                                            txtSotien
                                        ]
                                    },
                                    HBox {
                                        spacing: 10,
                                        content: [
                                            ngay,
                                            listDays,
                                            thang,
                                            listMonths,
                                            nam,
                                            listYears
                                        ]
                                    },
                                    HBox {
                                        spacing: 50,
                                        content: [
                                            buttonReset,
                                            buttonSave
                                        ]
                                    }
                                ]
                            }

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
    loadCategoryAddNew();
    loadYearsAddNew();
    loadMonthsAddNew();
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

function btnDelete(): Void {
    var result: Boolean = Alert.question("Bạn có muốn xóa mặt hàng này?");
    println('decision of me == {result}');
}

function btnChooseFile(): Void {
    var filePath: String = ChooseFile.OpenChooser();
    txtHinhanh.text = filePath;
}

function btnReset(): Void {
    LoadDataForEditForm(EditingStockDTO);
}

function btnSave(): Void {
    SaveStock();
}

loadYears();/*Load yesr for EDIT form*/

loadMonths();/*Load month for EDIT form*/


function loadYears(): Void {
    var yearArray: String[] = DateTimeUtils.getYears();
    listYears.items = null;
    for (y in yearArray) {
        var entry: String = "{y}";
        insert entry into listYears.items;
    }
    listYears.select(0);
}

function loadMonths(): Void {
    var monthArray: String[] = DateTimeUtils.getMonths();
    listMonths.items = null;
    for (m in monthArray) {
        var entry: String = "{m}";
        insert entry into listMonths.items;
    }
    listMonths.select(0);
}

var bindToYear = bind listYears.selectedIndex on replace {
            loadDays();
        }
var bindToMonth = bind listMonths.selectedIndex on replace {
            loadDays();
        }
var bindToSoluong = bind txtSoluong.text on replace {
            if (txtSoluong.text != "" and txtDongia.text != "" and Validator.isNumber(txtSoluong.text) and Validator.isNumber(txtDongia.text)) {
                txtSotien.text = "{Integer.valueOf(txtSoluong.text) * Integer.valueOf(txtDongia.text)}";
            }

        }
var bindToDongia = bind txtDongia.text on replace {
            if (txtSoluong.text != "" and txtDongia.text != "" and Validator.isNumber(txtSoluong.text) and Validator.isNumber(txtDongia.text)) {
                txtSotien.text = "{Integer.valueOf(txtSoluong.text) * Integer.valueOf(txtDongia.text)}";
            }
        }

function loadDays(): Void {
    //DateTimeUtils.getDays(listMonths.selectedIndex,listYears.selectedIndex);
    println("val month index == {listMonths.selectedIndex} || year index == {listYears.selectedIndex}");
    var dayArray: String[] = DateTimeUtils.getDays(listMonths.selectedIndex.intValue() + 1, listYears.selectedIndex.intValue() + 2000);
    listDays.items = null;
    for (d in dayArray) {
        var entry: String = "{d}";
        insert entry into listDays.items;
    }
    listDays.select(0);
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

function loadCategory(i: Integer): Void {
    var cateArray: String[] = CategoryServices.LoadCategory();
    listCats.items = null;
    for (c in cateArray) {
        var entry: String = "{c}";
        insert entry into listCats.items;
    }
    listCats.select(i);
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
            EditingStockDTO = stockDTO;/*This EditingStockDTO is used for RESET BUTTON*/
            GetSelectedDetail(stockDTO);
        //            EditingStockDTO = stockDTO;/*This EditingStockDTO is used for RESET BUTTON*/
        //            strCategory = "Loại hàng: {CategoryServices.GetCategoryName(stockDTO.getCategoryID())}";
        //
        //            var sdf: SimpleDateFormat = new SimpleDateFormat("dd/MM/yyyy");
        //            var strDay = sdf.format(stockDTO.getCr8_Date()) as String;
        //
        //            strDate = "Ngày nhập: {strDay}";
        //            strAmount = "Số lượng: {stockDTO.getSoluong()}";
        //            strPrice = "Đơn giá: {stockDTO.getDongia()}";
        //            strSum = "Số tiền: {stockDTO.getSotien()}";
        //LoadDataForEditForm(stockDTO);
        }

function GetSelectedDetail(stockDTO: StockDTO): Void {

    strCategory = "Loại hàng: {CategoryServices.GetCategoryName(stockDTO.getCategoryID())}";

    var sdf: SimpleDateFormat = new SimpleDateFormat("dd/MM/yyyy");
    var strDay = sdf.format(stockDTO.getCr8_Date()) as String;

    strDate = "Ngày nhập: {strDay}";
    strAmount = "Số lượng: {stockDTO.getSoluong()}";
    strPrice = "Đơn giá: {stockDTO.getDongia()}";
    strSum = "Số tiền: {stockDTO.getSotien()}";
    LoadDataForEditForm(stockDTO);
}

function LoadDataForEditForm(stockDTO: StockDTO): Void {
    /*BEGIN prepare data for edit form*/
    txtTenhang.text = listItems.selectedItem as String;
    loadCategory(stockDTO.getCategoryID() - 1);
    txtSoluong.text = "{stockDTO.getSoluong()}";
    txtDongia.text = "{stockDTO.getDongia()}";
    txtSotien.text = "{stockDTO.getSotien()}";

    var mydate: Date = stockDTO.getCr8_Date();
    var sdf: SimpleDateFormat = new SimpleDateFormat("d");
    var strDay = sdf.format(mydate) as String;

    sdf = new SimpleDateFormat("M");
    var strMonth = sdf.format(mydate) as String;

    sdf = new SimpleDateFormat("yyyy");
    var strYear = sdf.format(mydate) as String;

    listDays.select(Integer.valueOf(strDay) - 1);
    listMonths.select(Integer.valueOf(strMonth) - 1);
    listYears.select(Integer.valueOf(strYear) - 2000);

/*END prepare data for edit form*/
}

function SaveStock(): Void {
    var stockServices = new StockServices();

    var stockDTO = new StockDTO();

    if (Validator.isNumber(txtSoluong.text)) {
        stockDTO.setSoluong(Integer.valueOf(txtSoluong.text));
    }
    if (Validator.isNumber(txtDongia.text)) {
        stockDTO.setDongia(Integer.valueOf(txtDongia.text));
    }
    stockDTO.setSotien(Integer.valueOf(txtSotien.text));

    stockDTO.setStockName(txtTenhang.text);

    var cr8_date = DateTimeUtils.getDate(listDays.selectedIndex.intValue() + 1,
            listMonths.selectedIndex.intValue() + 1,
            listYears.selectedIndex.intValue() + 2000);

    stockDTO.setCr8_Date(cr8_date);
    stockDTO.setCategoryID(listCats.selectedIndex.intValue() + 1);

    if (StockValidator.ValidateUpdateStockBean(stockDTO)) {
        if (stockServices.saveForUpdate(EditingStockDTO, stockDTO) > 0) {
            GetSelectedDetail(stockDTO);
            strNote = "Thông báo: ĐÃ LƯU ĐƠN HÀNG";
            println("Thông báo: ĐÃ LƯU ĐƠN HÀNG");
        }

    } else {
        strNote = "Thông báo: MẶT HÀNG KHÔNG HỢP LỆ";
        println("Thông báo: MẶT HÀNG KHÔNG HỢP LỆ");
        return;
    }

}
/*BEGIN function for Form Addnew*/

function btnChooseFileAddNew(): Void {
    var filePath: String = ChooseFile.OpenChooser();
    txtHinhanhAddNew.text = filePath;
    var strUrl = "file:/C:/Users/Public/Pictures/Sample Pictures/Desert.jpg";
    strUrl = "file:/{filePath}";
    imageAddNew = Image {
                url: strUrl;
            }
}

function loadCategoryAddNew(): Void {
    var cateArray: String[] = CategoryServices.LoadCategory();
    listCatsAddNew.items = null;
    for (c in cateArray) {
        var entry: String = "{c}";
        insert entry into listCatsAddNew.items;
    }
    listCatsAddNew.select(0);
}

var bindToSoluongAddNew = bind txtSoluongAddNew.text on replace {
            if (txtSoluongAddNew.text != "" and txtDongiaAddNew.text != "" and Validator.isNumber(txtSoluongAddNew.text) and Validator.isNumber(txtDongiaAddNew.text)) {
                txtSotienAddNew.text = "{Integer.valueOf(txtSoluongAddNew.text) * Integer.valueOf(txtDongiaAddNew.text)}";
            }

        }
var bindToDongiaAddNew = bind txtDongiaAddNew.text on replace {
            if (txtSoluongAddNew.text != "" and txtDongiaAddNew.text != "" and Validator.isNumber(txtSoluongAddNew.text) and Validator.isNumber(txtDongiaAddNew.text)) {
                txtSotienAddNew.text = "{Integer.valueOf(txtSoluongAddNew.text) * Integer.valueOf(txtDongiaAddNew.text)}";
            }
        }

function loadYearsAddNew(): Void {
    var yearArray: String[] = DateTimeUtils.getYears();
    listYearsAddNew.items = null;
    for (y in yearArray) {
        var entry: String = "{y}";
        insert entry into listYearsAddNew.items;
    }
    listYearsAddNew.select(0);
}

function loadMonthsAddNew(): Void {
    var monthArray: String[] = DateTimeUtils.getMonths();
    listMonthsAddNew.items = null;
    for (m in monthArray) {
        var entry: String = "{m}";
        insert entry into listMonthsAddNew.items;
    }
    listMonthsAddNew.select(0);
}

function loadDaysAddNew(): Void {
    //DateTimeUtils.getDays(listMonths.selectedIndex,listYears.selectedIndex);
    var dayArray: String[] = DateTimeUtils.getDays(listMonthsAddNew.selectedIndex.intValue() + 1, listYearsAddNew.selectedIndex.intValue() + 2000);
    listDaysAddNew.items = null;
    for (d in dayArray) {
        var entry: String = "{d}";
        insert entry into listDaysAddNew.items;
    }
    listDaysAddNew.select(0);
}

var bindToYearAddNew = bind listYearsAddNew.selectedIndex on replace {
            loadDaysAddNew();
        }
var bindToMonthAddNew = bind listMonthsAddNew.selectedIndex on replace {
            loadDaysAddNew();
        }

function btnSaveActionAddNew(): Void {
    println(txtTenhangAddNew.text);
    SaveStockAddNew();
}

function SaveStockAddNew(): Void {
    var stockServices = new StockServices();

    var stockDTO = new StockDTO();

    if (Validator.isNumber(txtSoluongAddNew.text)) {
        stockDTO.setSoluong(Integer.valueOf(txtSoluongAddNew.text));
    }
    if (Validator.isNumber(txtDongiaAddNew.text)) {
        stockDTO.setDongia(Integer.valueOf(txtDongiaAddNew.text));
    }
    stockDTO.setSotien(Integer.valueOf(txtSotienAddNew.text));

    stockDTO.setStockName(txtTenhangAddNew.text);

    var cr8_date = DateTimeUtils.getDate(listDaysAddNew.selectedIndex.intValue() + 1,
            listMonthsAddNew.selectedIndex.intValue() + 1,
            listYearsAddNew.selectedIndex.intValue() + 2000);

    stockDTO.setCr8_Date(cr8_date);
    stockDTO.setCategoryID(listCatsAddNew.selectedIndex.intValue() + 1);

    if (StockValidator.ValidateNewStockBean(stockDTO)) {
        stockServices.saveForAdd(stockDTO);
        strNoteAddNew = "Thông báo: ĐÃ LƯU ĐƠN HÀNG";
    } else {
        strNoteAddNew = "Thông báo: MẶT HÀNG KHÔNG HỢP LỆ";
        return;
    }

}
/*END function for Form Addnew*/
