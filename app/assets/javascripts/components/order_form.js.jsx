var OrderForm = React.createClass({
  getInitialState: function() {
    return { restaurantName: '' };
  },
  handleInputChange: function(e) {
    this.setState({ restaurantName: e.target.value.trim() });
  },
  handleAddOrderClick: function(e) {
    e.preventDefault();
    if (!this.state.restaurantName) return;
    ReactDOM.findDOMNode(this.refs.body).value = '';
    this.setState({ restaurantName: '' });
    this.props.onOrderSubmit({ order: { name: this.state.restaurantName } });
  },
  render: function() {
    return (
      <form className='inline-form' onSubmit={this.handleAddOrderClick}>
        <input className='form-control' id='order-form' placeholder='Restaurant name'
               onChange={this.handleInputChange} ref='body' />
        <input className='btn btn-default' type='submit' value='Create order' />
      </form>
    );
  }
});
