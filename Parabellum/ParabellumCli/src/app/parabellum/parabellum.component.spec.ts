import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { ParabellumComponent } from './parabellum.component';

describe('ParabellumComponent', () => {
  let component: ParabellumComponent;
  let fixture: ComponentFixture<ParabellumComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ ParabellumComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(ParabellumComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
