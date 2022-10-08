module Demo3.Classes.Errors.ShopClosed where

import Demo3.Classes.Monad
import Demo3.Classes.Time

class (HasMonad ctx, HasTime ctx) => InjectShopClosedError ctx where
  raise_shop_closed_error :: Time ctx -> M ctx a
