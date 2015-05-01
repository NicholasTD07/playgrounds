from django.http import HttpResponse

from .models import Question


# Create your views here.
def index(request):
    latest_questions = Question.objects.order_by('-pub_date')[:5]
    output = ', '.join(
            [question.question_text for question in latest_questions])
    return HttpResponse(output)
