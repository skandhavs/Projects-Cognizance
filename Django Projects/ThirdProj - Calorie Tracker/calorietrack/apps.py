from django.apps import AppConfig
class CaloriesConfig(AppConfig):
    default_auto_field = 'django.db.models.BigAutoField'
    name = 'calorietrack'
    def ready(self): 
        import calorietrack.signals 