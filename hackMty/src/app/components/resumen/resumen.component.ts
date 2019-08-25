import { Component, OnInit } from '@angular/core';
import {DbService} from '../../services/db.service';

@Component({
  selector: 'hack-resumen',
  templateUrl: './resumen.component.html',
  styleUrls: ['./resumen.component.css']
})
export class ResumenComponent implements OnInit {


  proveedores;
  gastoGrande;
  proveedorGrande;

  gastos;

  exampleData;

  constructor(private db: DbService ) { }

  ngOnInit() {

    this.db.get('proveedores-periodo')
      .then(data => {
        data.count = data[0]['COUNT(emisorrfc)'];
        this.proveedores = data;
      });

    this.db.get('mayor-gasto')
      .then(data => {
        data = data[0];
        this.gastoGrande = data;
        console.log(data);
      });

    this.db.get('proveedor_mas_grande')
      .then(data => {
        this.proveedorGrande = data[0];
        this.proveedorGrande.total = this.proveedorGrande['SUM(total)'];
      });

    this.db.get('compras_top10_vista_tabla')
      .then(data => {
        this.gastos = data;
      });
  }

  example(rfc) {
    this.exampleData = null;
    console.log(rfc)
    fetch(this.db.baseUrl + 'gastos_totales', {
      method: 'POST',
      body: JSON.stringify({rfc: rfc})
    }).then(result => result.json()).then(data => {
      this.exampleData = data;
    });
  }

}
