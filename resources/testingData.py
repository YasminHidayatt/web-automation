from robot.api.deco import keyword, library


class Product:
    def __init__(self):
        self._product_name = None
        self._product_price = 0.0
        self._product_quantity = 0
        self._tax_product = 0.0
        self._total_amount = 0.0

    def set_product_name(self, value: str):
        self._product_name = value

    def set_product_price(self, value: float):
        self._product_price = value

    def set_product_quantity(self, value: int):
        self._product_quantity = value

    def set_tax_product(self, value: float):
        self._tax_product = value

    def set_total_amount(self, value: float):
        self._total_amount = value

    @property
    def product_name(self):
        return self._product_name

    @property
    def product_price(self):
        return self._product_price

    @property
    def product_quantity(self):
        return self._product_quantity

    @property
    def tax_product(self):
        return self._tax_product

    @property
    def total_amount(self):
        return self._total_amount

@library
class ProductLibrary:
    ROBOT_AUTO_KEYWORDS = True

    def __init__(self):
        self.product = Product()

    @keyword('Set Product Details')
    def set_product_details(self, name, price, quantity, tax):
        self.product.set_product_name(name)
        self.product.set_product_price(price)
        self.product.set_product_quantity(quantity)
        self.product.set_tax_product(tax)
        self.product.set_total_amount((price * quantity) + tax)

    @keyword('Get Product Details')
    def get_product_details(self):
        return {
            "name": self.product.product_name,
            "price": self.product.product_price,
            "quantity": self.product.product_quantity,
            "tax": self.product.tax_product,
            "total_amount": self.product.total_amount
        }
     