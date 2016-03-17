var OrderBox = React.createClass({
  getInitialState: function() {
    return { orders: [] };
  },
  componentDidMount: function() {
    this.getOrders();
  },
  getOrders: function() {
    $.ajax({
      url: 'orders.json',
      dataType: 'json',
      success: function(data) {
        this.setState({ orders: data });
      }.bind(this),
      error: function(xhr, status, err) {
        console.error('orders.json', status, err.toString());
      }.bind(this)
    });
  },
  handleOrderSubmit: function(order) {
    $.ajax({
      url: 'orders.json',
      dataType: 'json',
      type: 'POST',
      data: order,
      success: function(data) {
        this.setState({ orders: data });
      }.bind(this),
      error: function(xhr, status, err) {
        console.error('orders.json', status, err.toString());
      }.bind(this)
    });
  },
  render: function() {
    return (
      <div>
        <OrderForm onOrderSubmit={this.handleOrderSubmit} />
        <OrderList orders={this.state.orders} />
      </div>
    );
  }
});
