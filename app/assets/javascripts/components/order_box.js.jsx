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
      function(data) { 
        this.setState({ orders: this.state.orders.concat(data) });
    }.bind(this));
  },
  render: function() {
    return (
      <div className='order-box'>
        <div className='order-box__management'>
          <div className='management__form'>
            <OrderForm onOrderSubmit={this.handleOrderSubmit} />
          </div>
          <div className='management__orders-type'>
            <button className='btn btn-default' id='active' onClick={this.handleChangeOrdersType}>Active</button>
            <button className='btn btn-default' id='history' onClick={this.handleChangeOrdersType}>History</button>
          </div>
        </div>
        <OrderList orders={this.state.orders} />
      </div>
    );
  }
});
