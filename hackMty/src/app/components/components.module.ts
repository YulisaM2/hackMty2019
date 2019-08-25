import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { CardComponent } from './card/card.component';
import { ChartComponent } from './chart/chart.component';
import {ChartsModule} from "ng2-charts";
import { FacturacionComponent } from './facturacion/facturacion.component';
import { ResumenComponent } from './resumen/resumen.component';
import { VentasComponent } from './ventas/ventas.component';

@NgModule({
  declarations: [CardComponent, ChartComponent, FacturacionComponent, ResumenComponent, VentasComponent],
  exports: [
    CardComponent,
    ChartComponent,
    FacturacionComponent,
    ResumenComponent,
    VentasComponent
  ],
  imports: [
    CommonModule,
    ChartsModule
  ]
})
export class ComponentsModule { }
