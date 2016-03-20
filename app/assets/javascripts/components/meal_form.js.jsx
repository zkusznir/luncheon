var MealForm = React.createClass({
  clearInputFields: function() {
    ReactDOM.findDOMNode(this.refs.meal).value = '';
    ReactDOM.findDOMNode(this.refs.price).value = '';
  },
  handleAddMealClick: function(e) {
    e.preventDefault();
    var name = ReactDOM.findDOMNode(this.refs.meal).value.trim();
    var price = ReactDOM.findDOMNode(this.refs.price).value.trim();
    if (!name && !price) return;
    this.clearInputFields();
    this.props.onMealSubmit({ meal: { name: name, price: price } });
  },
  render: function() {
    return (
      <div>
        <form className='meal-form inline-form' onSubmit={this.handleAddMealClick}>
          <input className='form-control' id='meal-form__name'
                 placeholder='Meal name' ref='meal' />
          <input className='form-control' id='meal-form__price'
                 placeholder='Price' ref='price' />
          <input className='btn btn-default' type='submit' value='Add' />
        </form>
      </div>
    );
  }
});
