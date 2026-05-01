// utils/templateDebugger.js
export class TemplateDebugger {
  constructor() {
    this.logs = [];
  }

  validateTemplate(template) {
    const issues = [];

    // Basic template validation
    if (!template.id) {
      issues.push(`Template missing ID`);
    }
    if (!template.template) {
      issues.push(`Template ${template.id} missing XSL template path`);
    }

    // Check children references
    if (template.children) {
      template.children.forEach((child) => {
        if (!child.ref) {
          issues.push(`Child template in ${template.id} missing reference`);
        }
      });
    }

    // Check file paths
    if (template.template && !this.validateXSLPath(template.template)) {
      issues.push(`XSL file not found: ${template.template}`);
    }

    return {
      isValid: issues.length === 0,
      issues,
      template,
    };
  }

  logTemplateSelection(templateId, selectedTemplate, children) {
    this.logs.push({
      timestamp: new Date(),
      event: "template_selection",
      templateId,
      template: selectedTemplate,
      children,
    });
  }

  logGenerationAttempt(templateId, data) {
    this.logs.push({
      timestamp: new Date(),
      event: "generation_attempt",
      templateId,
      inputData: data,
    });
  }

  logGenerationResult(templateId, success, output, error) {
    this.logs.push({
      timestamp: new Date(),
      event: "generation_result",
      templateId,
      success,
      output: output,
      error: error,
    });
  }

  validateXSLPath(path) {
    // TODO: Add actual file existence check
    return true;
  }

  getTemplateHierarchy(template) {
    return {
      id: template.id,
      name: template.name,
      path: template.template,
      children: template.children
        ? template.children.map((child) => ({
            ref: child.ref,
            required: child.required,
          }))
        : [],
    };
  }

  getDiagnosticReport() {
    return {
      logs: this.logs,
      summary: this.generateSummary(),
    };
  }

  generateSummary() {
    const summary = {
      totalEvents: this.logs.length,
      successfulGenerations: 0,
      failedGenerations: 0,
      templateSelections: 0,
    };

    this.logs.forEach((log) => {
      switch (log.event) {
        case "generation_result":
          log.success
            ? summary.successfulGenerations++
            : summary.failedGenerations++;
          break;
        case "template_selection":
          summary.templateSelections++;
          break;
      }
    });

    return summary;
  }

  clearLogs() {
    this.logs = [];
  }
}
