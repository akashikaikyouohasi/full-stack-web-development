from django.db import models

# Create your models here.
class Product(models.Model): # モデル作成時にはDjangoのModelクラスの継承が必要
    """
    商品
    """
    # IDは自動で付与されるので定義不要。
    name = models.CharField(max_length=100, verbose_name='商品名') # verbose_nameは論理名
    price = models.IntegerField(verbose_name='価格')
    description = models.TextField(verbose_name='商品説明', null=True, blank=True)

    class Meta:
        """
        メタ情報
        """
        db_table = 'product'
        verbose_name = '商品'

class Purchase(models.Model):
    """
    仕入れ
    """
    product = models.ForeignKey(Product, on_delete=models.CASCADE) # 外部キー
    quantity = models.IntegerField(verbose_name='数量')
    purchase_date = models.DateTimeField(verbose_name='仕入日時')

    class Meta:
        """
        メタ情報
        """
        db_table = 'purchase'
        verbose_name = '仕入'

class Sales(models.Model):
    """
    売上
    """
    product = models.ForeignKey(Product, on_delete=models.CASCADE) # 外部キー
    quantity = models.IntegerField(verbose_name='数量')
    sales_date = models.DateTimeField(verbose_name='売上日時')

    class Meta:
        """
        メタ情報
        """
        db_table = 'sales'
        verbose_name = '売上'
