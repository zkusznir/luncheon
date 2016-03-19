var OrderBox = React.createClass({
  getInitialState: function() {
    return { orders: [] };
  },
  componentWillMount: function() {
    this.getOrders();
  },
  handleChangeOrdersType: function(e) {
    this.getOrders({ type: e.target.id });
  },
  getOrders: function(type) {
    Luncheon.backend('orders.json', 'GET', type).then(
      function(data) { this.setState({ orders: data });
    }.bind(this));
  },
  handleOrderSubmit: function(order) {
    Luncheon.backend('orders.json', 'POST', order).then(
      function(data) { this.setState({ orders: data });
    }.bind(this));
  },
  render: function() {
    return (
      <div>
        <OrderForm onOrderSubmit={this.handleOrderSubmit} />
        <button id="active" onClick={this.handleChangeOrdersType}>Active</button>
        <button id="history" onClick={this.handleChangeOrdersType}>History</button>
        <OrderList orders={this.state.orders} />
      </div>
    );
  }
});
