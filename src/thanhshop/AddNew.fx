/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package thanhshop;

import javafx.stage.Stage;
import javafx.scene.control.Button;
import javafx.scene.effect.InnerShadow;
import javafx.scene.paint.Color;
import javafx.scene.shape.Rectangle;
import javafx.stage.StageStyle;
import javafx.scene.layout.HBox;
import javafx.scene.layout.VBox;
import javafx.scene.control.Label;
import javafx.ext.swing.SwingTextField;
import com.datnt.services.StockServices;
import com.datnt.DTO.StockDTO;
import javafx.scene.control.ChoiceBox;
import com.datnt.utils.DateTimeUtils;
import com.datnt.beanvalidator.StockValidator;
import com.datnt.services.CategoryServices;
import com.datnt.utils.Validator;

/**
 * @author datnt
 */
// place your code here
public class AddNew extends Stage {

    var btnClose: Button;
    var btnSave = Button {
                text: "Save"
                action: btnSaveAction
            };
    public var color: Color = Color.BLACK;
    var strNote = "Thông báo: ";
    var thongbaoloi = Label {
                text: bind strNote
            };
    var tenhang = Label {
                text: "Tên Hàng"
            };
    var txtTenhang = SwingTextField {
                columns: 10
                width: 100
                text: "Ten hang"
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
                editable:false
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

    init {
        scene = javafx.scene.Scene {
                    fill: Color.LIGHTGREY;
                    content: [
                        VBox {
                            content: [
                                HBox {
                                    spacing: 20,
                                    content: [
                                        thongbaoloi,
                                    ]
                                },
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
                                        btnClose = Button {
                                                    text: "Close"
                                                    action: function() {
                                                        close();
                                                    }
                                                },
                                        btnSave
                                    ]
                                }
                            ],
                            spacing: 10,
                            layoutY: 30,
                            layoutX: 30
                        }
                    ],
                    width: 600;
                    height: 600;
                }

        this.resizable = true;
        this.width = scene.width + 5;
        this.height = scene.height + 5;
        this.loadYears();
        this.loadMonths();
        this.loadCategory();
    //this.style =  StageStyle.TRANSPARENT;
    }

    /*FUNCTION AREA*/
    function loadCategory(): Void {
        var cateArray: String[] = CategoryServices.LoadCategory();
        listCats.items = null;
        for (c in cateArray) {
            var entry: String = "{c}";
            insert entry into listCats.items;
        }
        listCats.select(0);
    }

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

    function btnChooseFile(): Void {
        var filePath: String = ChooseFile.OpenChooser();
        txtHinhanh.text = filePath;
    }

    function btnSaveAction(): Void {
        println(txtTenhang.text);
        SaveStock();
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

        if (StockValidator.ValidateStockBean(stockDTO)) {
            stockServices.saveForAdd(stockDTO);
            strNote = "Thông báo: ĐÃ LƯU ĐƠN HÀNG";
        } else {
            strNote = "Thông báo: MẶT HÀNG KHÔNG HỢP LỆ";
            return;
        }

    }

}
