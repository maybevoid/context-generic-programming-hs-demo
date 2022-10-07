module App.Classes.Errors.ShopClosed where

import App.Classes.Monad
import App.Classes.Time

class (HasMonad ctx, HasTime ctx) => InjectShopClosedError ctx where
  raise_shop_closed_error :: Time ctx -> M ctx a
