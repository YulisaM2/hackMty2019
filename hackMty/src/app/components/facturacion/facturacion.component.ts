import { Component, OnInit } from '@angular/core';
import {DbService} from '../../services/db.service';

@Component({
  selector: 'hack-facturacion',
  templateUrl: './facturacion.component.html',
  styleUrls: ['./facturacion.component.css']
})
export class FacturacionComponent implements OnInit {

  constructor(private db: DbService) { }
  ventas;
  gastos;
  utilidad;
  data = [];

  ngOnInit() {
    this.db.get('ventas_totales')
      .then(data => {
        console.log(data);
        this.ventas = data;
      });

    this.db.get('utilidad_total')
      .then(data => {
        console.log(data);
        this.utilidad = data;
      });

    this.db.get('gastos_totales')
      .then(data => {
        console.log(data);
        this.gastos = data;
      });
    this.db.get('ventas_periodo')
      .then(data => {
        const realData = [];

        data.map(element => {
          realData.push(element);
        });

        this.data.push({realData, label: 'Ingresos'});
        console.log(data);
      });
  }

}
