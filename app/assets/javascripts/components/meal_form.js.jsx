var MealForm = React.createClass({
  getInitialState: function() {
    return { name: '', price: '', errorMessage: '' };
  },
  handleNameChange: function() {
    this.setState({ name: ReactDOM.findDOMNode(this.refs.meal).value });
  },
  handlePriceChange: function() {
    this.setState({ price: ReactDOM.findDOMNode(this.refs.price).value });
  },
  clearInputFields: function() {
    this.setState({ name: '', price: '', errorMessage: '' });
    ReactDOM.findDOMNode(this.refs.meal).value = '';
    ReactDOM.findDOMNode(this.refs.price).value = '';
    ReactDOM.findDOMNode(this.refs.price).value = '';
  },
  validInputs: function() {
    if (!this.state.name || !this.state.price) {
      this.setState({ errorMessage: 'Please fill in both name and price fields' });
      return false;
    } else if (!parseInt(this.state.price)) {
      this.setState({ errorMessage: 'Price has to be numerical' });
      return false;
    } else if (parseInt(this.state.price) <= 0) {
      this.setState({ errorMessage: 'Price has to be greater than 0' });
      return false;
    } else {
      return true;
    }
  },
  handleAddMealClick: function(e) {
    e.preventDefault();
    if (!this.validInputs()) return;
    this.clearInputFields();
    this.props.onMealSubmit({ meal: { name: this.state.name, price: this.state.price } });
  },
  render: function() {
    return (
      <div>
        <b className='errors' ref='errors'>{this.state.errorMessage}</b>
        <form className='meal-form inline-form' onSubmit={this.handleAddMealClick}>
          <input className='form-control' id='meal-form__name'
                 placeholder='Meal name' onChange={this.handleNameChange} ref='meal' />
          <input className='form-control' id='meal-form__price'
                 placeholder='Price' onChange={this.handlePriceChange} ref='price' />
          <input className='btn btn-default' type='submit' value='Add' />
        </form>
      </div>
    );
  }
});
