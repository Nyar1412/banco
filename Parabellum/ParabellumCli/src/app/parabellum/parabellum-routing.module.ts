import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';

import { ParabellumComponent } from './parabellum.component';

const routes: Routes = [{ path: '', component: ParabellumComponent }];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class ParabellumRoutingModule { }
