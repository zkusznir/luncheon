OrderStatusForm = React.createClass({
  handleChange: function(e) {
    this.props.onStatusChange({ status: e.target.value });
  },
  render: function() {
    return (
      <div>
        <select id="order-status" value={this.props.status} onChange={this.handleChange}>
          <option value="Finalized">Finalized</option>
          <option value="Ordered">Ordered</option>
          <option value="Delivered">Delivered</option>
        </select>
      </div> 
    );
  }
});
