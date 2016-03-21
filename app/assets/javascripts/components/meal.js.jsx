var Meal = React.createClass({
  render: function() {
    return (
      <div className='meal'>
        <span>{this.props.index + 1}. {this.props.name}</span>
        <span>{Number(this.props.price).toFixed(2)} zł</span>
      </div>
    )
  }
});
