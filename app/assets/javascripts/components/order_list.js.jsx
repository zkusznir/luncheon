OrderList = React.createClass({
  render: function () {
    var orderNodes = this.props.orders.map(function (order, index) {
      return (
        <Order id={order.id} name={order.restaurant_name} status={order.status} key={index} />
      );
    });
    return (
      <div>{orderNodes}</div>
    );
  }
});
