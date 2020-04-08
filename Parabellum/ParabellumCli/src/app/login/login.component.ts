import { Component, OnInit } from '@angular/core';
import { UserServiceService } from '../core/service/user-service.service';
import { Usuario } from '../shared/modelo/usuario.model';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.scss']
})
export class LoginComponent implements OnInit {
  error = '';
  constructor(private _userService: UserServiceService) { }

  ngOnInit(): void {
  }

  logInUser(user, pass): void {
    this._userService.loginUser(new Usuario(user, pass, '')).subscribe(
      data => sessionStorage.setItem('token', data.access_token),
      error => {
        let mensaje = 'Error: ';
        if (error.statusText === 'Unauthorized' ) {
          mensaje += 'Contraseña o Usuario incorrectos';
        } else {
          mensaje += error.statusText;
        }
        this.error = mensaje;
      }
    );
  }

}
