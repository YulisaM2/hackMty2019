import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { CardComponent } from './card/card.component';
import { ChartComponent } from './chart/chart.component';
import {ChartsModule} from "ng2-charts";

@NgModule({
  declarations: [CardComponent, ChartComponent],
  exports: [
    CardComponent,
    ChartComponent
  ],
  imports: [
    CommonModule,
    ChartsModule
  ]
})
export class ComponentsModule { }
