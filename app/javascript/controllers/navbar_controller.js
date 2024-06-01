import { Controller } from "@hotwired/stimulus"
import { enter, leave, toggle } from 'el-transition'


export default class extends Controller {
  
  static targets = ['openUserMenu', 'button'];

  //document.addEventListener('DOMContentLoaded', function() {
  //});
  
  connect() {
    console.log('enter', enter);
    this.openUserMenuTarget.addEventListener('click', this.toggleDropdownMenu)
  
  }
  
  toggleDropdownMenu(){
    toggle(document.getElementById('menu-dropdown-items'));
  }

}