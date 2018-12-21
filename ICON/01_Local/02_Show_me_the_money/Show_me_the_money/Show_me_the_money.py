from iconservice import *

TAG = 'SMTM'

class SMTM(IconScoreBase):

    def __init__(self, db: IconScoreDatabase) -> None:
        super().__init__(db)

    def on_install(self) -> None:
        super().on_install()

    def on_update(self) -> None:
        super().on_update()

    @payable
    @external
    def Show_me_the_money(self) -> str:
        value = self.icx.get_balance(self.owner)
        Logger.debug(f'HAHA  ^ o ^ / I Got {value} ICX!', value)
        self.icx.transfer(self.owner, self.msg.value)
