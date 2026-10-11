resource "google_kms_ekm_connection_iam_binding" "kms_ekm_connection_iam_bindings" {
  for_each = var.kms_ekm_connection_iam_bindings

  members  = each.value.members
  name     = each.value.name
  role     = each.value.role
  location = each.value.location
  project  = each.value.project

  dynamic "condition" {
    for_each = each.value.condition != null ? [each.value.condition] : []
    content {
      description = condition.value.description
      expression  = condition.value.expression
      title       = condition.value.title
    }
  }
}

