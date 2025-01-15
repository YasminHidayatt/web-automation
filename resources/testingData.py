from robot.api.deco import keyword


class testingData:
    def __init__(self):
        self._product_name = None
        self._product_price = 0.0
        self._product_quantity = 0
        self._tax_product = 0.0
        self._total_amount = 0.0

    @keyword
    def set_product_name(self, value: str):
        self._product_name = value

    @keyword
    def set_product_price(self, value: float):
        self._product_price = value

    @keyword
    def set_product_quantity(self, value: int):
        self._product_quantity = value

    @keyword
    def set_tax_product(self, value: float):
        self._tax_product = value

    @keyword
    def set_total_amount(self, value: float):
        self._total_amount = value

    @keyword
    def get_product_name(self):
        return self._product_name

    @keyword
    def get_product_price(self):
        return self._product_price

    @keyword
    def get_product_quantity(self):
        return self._product_quantity

    @keyword
    def get_tax_product(self):
        return self._tax_product

    @keyword
    def get_total_amount(self):
        return self._total_amount