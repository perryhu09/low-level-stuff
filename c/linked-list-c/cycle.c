#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>

struct Node{
    int x;   
    struct Node* next;
};

struct Node* createNode(int x){
    struct Node* newNode = (struct Node*)malloc(sizeof(struct Node));
    newNode->x = x;
    newNode->next = NULL;
    return newNode;
}

void printList(struct Node* head){
    struct Node* temp = head;
    while(temp != NULL) {
        printf("%d ", temp->x);
        temp = temp->next;
    }
    printf("\n");
}

bool detectCycle(struct Node* head){
    struct Node* turtle = head; 
    struct Node* hare = head; 
    while(turtle != NULL && hare != NULL){
        turtle = turtle->next;
        hare = hare->next->next;
        if(turtle == hare) return true;
    }

    return false;
}

int main() {
    struct Node* head = createNode(5);
    head->next = createNode(3);
    head->next->next = createNode(7);
    head->next->next->next = createNode(2);
    head->next->next->next->next = head; //creates a cycle back to the head

    printf("%d\n", detectCycle(head));

    return 0;
}
