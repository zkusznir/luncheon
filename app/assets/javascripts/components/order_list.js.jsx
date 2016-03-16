OrderList = React.createClass({
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
  render: function () {
    var orderNodes = this.state.orders.map(function (order, index) {
      return (
        <Order id={order.id} name={order.restaurant_name} status={order.status} key={index} />
      );
    });
    return (
      <div>{orderNodes}</div>
    );
  }
});
