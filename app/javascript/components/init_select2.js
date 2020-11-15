import $ from 'jquery';
import 'select2';

// 15.11.2020 following template
const initSelect2 = () => {
  $('.select2').select2();
};

// 15.11.2020 Customization - Dynamic option creation, but needs
// const initSelect2 = () => {
//   $('.select2').select2({
//     tags: "true"
//   });
// };

export { initSelect2 };
