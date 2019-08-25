import { Component, OnInit } from '@angular/core';
import {DbService} from '../../services/db.service';

@Component({
  selector: 'hack-ventas',
  templateUrl: './ventas.component.html',
  styleUrls: ['./ventas.component.css']
})
export class VentasComponent implements OnInit {

  clientes;
  ventaGrande;
  clienteGrande;

  constructor(private db: DbService) { }

  ngOnInit() {
    this.db.get('cantidad_clientes')
      .then(data => {
        data = data[0]['COUNT(emisorrfc)'];
        this.clientes = data;
      });

    this.db.get('mayor-venta')
      .then(data => {
        console.log(data);
        this.ventaGrande = data;
      });

    this.db.get('cliente_mas_grande')
      .then(data => {
        data = data[0];
        data.total = data['SUM(total)'];
        console.log(data);
        this.clienteGrande = data;
      });
  }

}
