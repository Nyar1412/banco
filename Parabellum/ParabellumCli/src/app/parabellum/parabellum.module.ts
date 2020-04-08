import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { ParabellumRoutingModule } from './parabellum-routing.module';
import { ParabellumComponent } from './parabellum.component';


@NgModule({
  declarations: [ParabellumComponent],
  imports: [
    CommonModule,
    ParabellumRoutingModule
  ]
})
export class ParabellumModule { }
