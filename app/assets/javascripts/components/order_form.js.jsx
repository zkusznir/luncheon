var OrderForm = React.createClass({
  getInitialState: function() {
    return { restaurantName: "" };
  },
  handleInputChange: function(e) {
    this.setState({ restaurantName: e.target.value.trim() });
  },
  handleAddOrderClick: function(e) {
    if (!this.state.restaurantName) return;
    ReactDOM.findDOMNode(this.refs.body).value = "";
    this.setState({ restaurantName: "" });
    this.props.onOrderSubmit({ order: { name: this.state.restaurantName } });
  },
  render: function() {
    return (
      <form onSubmit={this.handleAddOrderClick}>
        <label>New order</label>
        <input id="order-form" placeholder="Restaurant name" onChange={this.handleInputChange} ref="body" />
        <input type="submit" value="Add" />
      </form>
    );
  }
});
