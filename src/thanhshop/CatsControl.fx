/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package thanhshop;

import javafx.stage.Stage;
import javafx.scene.paint.Color;
import javafx.scene.layout.VBox;
import javafx.scene.layout.HBox;
import javafx.scene.control.Label;
import javafx.ext.swing.SwingTextField;
import javafx.scene.control.Button;
import javafx.scene.control.ListView;
import com.datnt.services.CategoryServices;
import com.datnt.DTO.CategoryDTO;
import javafx.scene.control.CheckBox;

/**
 * @author datnt
 */
// place your code here
public class CatsControl extends Stage {

    var thongbaoloi = Label {
                text: "THONG BAO: "
            };
    var loaihang = Label {
                text: "Tên Danh mục"
            };
    var txtDanhmuc = SwingTextField {
                columns: 25
                width: 100
                text: ""
            };
    var mota = Label {
                text: "Mô tả"
            };
    var txtMota = SwingTextField {
                columns: 25
                width: 100
                text: ""
            };
    var btnSaveAddNew = Button {
                text: "Add"
                action: btnSaveAđNew
            };
    var listCats = ListView {
                layoutY: 60
                layoutX: 10
            }
    var loaihangEdit = Label {
                text: "Tên Danh mục"
            };
    var txtDanhmucEdit = SwingTextField {
                columns: 25
                width: 100
                text: ""
                editable: false
            };
    var btnSaveEdit = Button {
                text: "Save Edit"
                action: btnSaveEditAction
                disable: true
            };
    var motaEdit = Label {
                text: "Mô tả"
            };
    var txtMotaEdit = SwingTextField {
                columns: 25
                width: 100
                text: ""
                editable: false
            };
    var setEdit = CheckBox {
                text: "Chỉnh sửa"
                selected: false
            }
    var oldCategoryDTO: CategoryDTO;

    init {
        scene = javafx.scene.Scene {
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
                                        loaihang,
                                        txtDanhmuc,
                                        btnSaveAddNew,
                                    ]
                                },
                                HBox {
                                    spacing: 20,
                                    content: [
                                        mota,
                                        txtMota
                                    ]
                                },
                                HBox {
                                    spacing: 20,
                                    content: [
                                        listCats
                                    ]
                                },
                                HBox {
                                    spacing: 20,
                                    content: [
                                        loaihangEdit,
                                        setEdit,
                                        txtDanhmucEdit,
                                        btnSaveEdit
                                    ]
                                },
                                HBox {
                                    spacing: 20,
                                    content: [
                                        motaEdit,
                                        txtMotaEdit
                                    ]
                                },
                            ],
                            spacing: 10,
                            layoutY: 30,
                            layoutX: 30
                        },
                    ],
                    width: 600;
                    height: 600;
                }
        this.loadCategoryShowAll();
    }

    function loadCategoryShowAll(): Void {
        var cateArray: String[] = CategoryServices.LoadCategory();
        listCats.items = null;
        for (c in cateArray) {
            var entry: String = "{c}";
            insert entry into listCats.items;
        }
        listCats.select(0);
    }

    function btnSaveAđNew(): Void {

        var stockServices = new CategoryServices();

        var categoryDTO = new CategoryDTO();

        if (not "".equals(txtDanhmuc.text)) {
            categoryDTO.setName(txtDanhmuc.text);
            categoryDTO.setDescription(txtMota.text);
            CategoryServices.saveForAdd(categoryDTO);
            loadCategoryShowAll();
            thongbaoloi.text = "Tạo danh mục xong ";
        }

    }

    function btnSaveEditAction(): Void {
        var stockServices = new CategoryServices();

        var categoryDTO = new CategoryDTO();

        if (not "".equals(txtDanhmucEdit.text)) {
            categoryDTO.setName(txtDanhmucEdit.text);
            categoryDTO.setDescription(txtMotaEdit.text);
            CategoryServices.saveForEdit(oldCategoryDTO,categoryDTO);
            loadCategoryShowAll();
            setEdit.selected = false;
            thongbaoloi.text = "Cập nhật xong";
        }
    }

    var bindToSelectedCate = bind listCats.selectedItem on replace {
                if (listCats.selectedItem != null) {
                    var categoryDTO: CategoryDTO;
                    categoryDTO = CategoryServices.GetCategoryByName(listCats.selectedItem as String);
                    txtDanhmucEdit.text = categoryDTO.getName();
                    txtMotaEdit.text = categoryDTO.getDescription();
                    oldCategoryDTO = categoryDTO;
                }
            }
    var checkboxEvent = bind setEdit.selected on replace {
                txtDanhmucEdit.editable = setEdit.selected;
                txtMotaEdit.editable = setEdit.selected;
                btnSaveEdit.disable = not setEdit.selected;
            }
}


