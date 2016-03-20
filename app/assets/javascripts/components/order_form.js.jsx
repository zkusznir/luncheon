var OrderForm = React.createClass({
  getInitialState: function() {
    return { restaurantName: '', errorMessage: '' };
  },
  handleInputChange: function(e) {
    this.setState({ restaurantName: e.target.value.trim() });
  },
  clearInputFields: function() {
    this.setState({ restaurantName: '', errorMessage: '' });
    ReactDOM.findDOMNode(this.refs.errors).value = '';
    ReactDOM.findDOMNode(this.refs.name).value = '';
  },
  validInput: function() {
    if (this.state.restaurantName == '') {
      this.setState({ errorMessage: 'Please fill in the restaurant name!' });
      return false;
    } else {
      return true;
    }
  },
  handleAddOrderClick: function(e) {
    e.preventDefault();
    if (!this.validInput()) return;
    this.clearInputFields();
    this.props.onOrderSubmit({ order: { name: this.state.restaurantName } });
  },
  render: function() {
    return (
      <div>
        <b className='errors' ref='errors'>{this.state.errorMessage}</b>
        <form className='inline-form' onSubmit={this.handleAddOrderClick}>
          <input className='form-control' id='order-form' placeholder='Restaurant name'
                 onChange={this.handleInputChange} ref='name' />
          <input className='btn btn-default' type='submit' value='Create order' />
        </form>
      </div>
    );
  }
});
