import { Component, OnInit } from '@angular/core';
import { UserServiceService } from '../core/service/user-service.service';
// import { Route } from '@angular/compiler/src/core';
import { Usuario } from '../shared/modelo/usuario.model';

@Component({
  selector: 'app-register',
  templateUrl: './register.component.html',
  styleUrls: ['./register.component.scss']
})
export class RegisterComponent implements OnInit {
  error = '';
  model: Usuario = { nick: 'u', password: 's' , email: 'e' };


  constructor(
    private _userService: UserServiceService,
    // private _routing: Route
    ) { }

  ngOnInit(): void {
    this.error = (this._userService.isLogged()) ? sessionStorage.getItem('token') : 'No hay usuario registrado';
  }

  onSubmit(user, pass, email, repPas) {
    if ( pass === repPas && pass !== '') {
      if (this.error !== '') {
        this.cleanError();
      }
      this.model = { nick: user, password: pass , email };
      this.RegisterUserPass(this.model);
    } else {
      this.error = (pass !== '')
        ? 'las contraseñas no coinciden' : 'la contraseña no puede estar vacia';
    }
  }

  RegisterUserPass(user: Usuario): void {
    this._userService.registerUser(user).subscribe((response: any) => {
      if (response.access_token !== null) {
        this.error = response.access_token;
      } else {
        this.error = 'Ha habido un error , intentelo de nuevo mas tarde' ;
      }
    });
  }

  cleanError(): void {
    this.error = '';
  }

}
