#!/usr/bin/python3
import requests
import sys

def fetch_todo_list_progress(employee_id):
    """Fetch and display the TODO list progress of an employee by their ID."""
    # API URLs setup
    user_url = f"https://jsonplaceholder.typicode.com/users/{employee_id}"
    todos_url = f"https://jsonplaceholder.typicode.com/todos?userId={employee_id}"

    # Fetch user data
    user_response = requests.get(user_url)
    if user_response.status_code != 200:
        print("Failed to retrieve user data")
        return

    user_data = user_response.json()
    employee_name = user_data.get('name')

    # Fetch todo data
    todos_response = requests.get(todos_url)
    if todos_response.status_code != 200:
        print("Failed to retrieve todos data")
        return

    todos_data = todos_response.json()
    total_tasks = len(todos_data)
    completed_tasks = [task for task in todos_data if task['completed']]

    # Display the results
    print(f"Employee {employee_name} is done with tasks({len(completed_tasks)}/{total_tasks}):")
    for task in completed_tasks:
        print(f"\t {task['title']}")

if __name__ == "__main__":
    if len(sys.argv) != 2 or not sys.argv[1].isdigit():
        print("Usage: ./0-gather_data_from_an_API.py <employee_id>")
    else:
        fetch_todo_list_progress(int(sys.argv[1]))

