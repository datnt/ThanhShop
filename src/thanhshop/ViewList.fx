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

/**
 * @author datnt
 */
// place your code here
public class ViewList extends Stage {

    var thongbaoloi = Label {
                text: "THONG BAO: "
            };

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
                            ],
                            spacing: 10,
                            layoutY: 30,
                            layoutX: 30
                        },

                    ],
                    width: 600;
                    height: 600;
                }

    }

}
