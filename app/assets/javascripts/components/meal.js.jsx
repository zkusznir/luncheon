var Meal = React.createClass({
  render: function() {
    return (
      <div className='meal'>
        <span>{this.props.index + 1}. {this.props.name}</span>
        <span>{this.props.price} zł</span>
      </div>
    )
  }
});
