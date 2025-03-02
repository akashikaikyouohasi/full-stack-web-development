from django.db import models

# Create your models here.
class Product(models.Model): # モデル作成時にはDjangoのModelクラスの継承が必要
    """
    商品
    """
    # IDは自動で付与されるので定義不要。
    name = models.CharField(max_length=100, verbose_name='商品名') # verbose_nameは論理名
    price = models.IntegerField(vaebose_name='価格')
    description = models.TextField(verbose_name='商品説明', null=True, blank=True)

    class Meta:
        """
        メタ情報
        """
        db_table = 'product'
        verbose_name = '商品'
